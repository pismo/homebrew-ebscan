package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os/exec"
	"strings"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/awserr"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/elasticbeanstalk"
)

func main() {

	var envContains string
	var envName string
	var envNewValue string

	flag.StringVar(&envContains, "contains", "", "The current value of the environment variable to be scanned")
	flag.StringVar(&envName, "set", "", "The name of the environment variable to be set")
	flag.StringVar(&envNewValue, "to", "", "The new value of the environment variable to set")

	flag.Parse()

	if envContains == "" {
		panic("contains - must be provided with the name value to be scanned within env vars")
	}

	if envName == "" {
		fmt.Println("set - flag not provided, will proceed only displaying current values")
	}

	if envNewValue == "" {
		fmt.Println("to - flag not provided, will proceed only displaying current values")
	}

	config := &aws.Config{Region: aws.String("sa-east-1")}
	awsSession := session.New(config)
	svc := elasticbeanstalk.New(awsSession)

	input := &elasticbeanstalk.DescribeEnvironmentsInput{}

	result, err := svc.DescribeEnvironments(input)
	if err != nil {
		if aerr, ok := err.(awserr.Error); ok {
			switch aerr.Code() {
			default:
				fmt.Println(aerr.Error())
			}
		} else {
			// Print the error, cast err to awserr.Error to get the Code and
			// Message from an error.
			fmt.Println(err.Error())
		}
		return
	}

	for _, environment := range result.Environments {
		api := *environment.ApplicationName
		version := *environment.VersionLabel
		environmentName := *environment.EnvironmentName

		input, err := ioutil.ReadFile(".elasticbeanstalk/config.yml")
		if err != nil {
			log.Fatalln(err)
		}

		lines := strings.Split(string(input), "\n")

		for i, line := range lines {
			if strings.Contains(line, "application_name:") {
				lines[i] = fmt.Sprintf("  application_name: %s", api)
			}
		}

		output := strings.Join(lines, "\n")
		err = ioutil.WriteFile(".elasticbeanstalk/config.yml", []byte(output), 0644)
		if err != nil {
			log.Fatalln(err)
		}

		command := fmt.Sprintf("eb printenv %s", environmentName)

		out, err := exec.Command("bash", "-c", command).Output()
		if err != nil {
			fmt.Printf("error occured for env %s and version %s - %s", api, version, err)
			fmt.Println("")
		}

		lines = strings.Split(string(out), "\n")

		for i, line := range lines {
			if strings.Contains(line, envContains) {

				fmt.Println(api, "\t", version, "\t", environmentName, "\t", lines[i])

				if envNewValue != "" {
					fmt.Println("Performing setenv")
					useCommand := fmt.Sprintf("eb use %s", environmentName)
					fmt.Println(useCommand)
					outUse, err := exec.Command("bash", "-c", useCommand).Output()
					if err != nil {
						fmt.Printf("error occured when use env %s and version %s - %s", api, version, err)
					}
					fmt.Printf("%s", outUse)

					setenvCommand := fmt.Sprintf("eb setenv %s='%s'", envName, envNewValue)
					fmt.Println(setenvCommand)
					outSubst, err := exec.Command("bash", "-c", setenvCommand).Output()
					if err != nil {
						fmt.Printf("error occured when subst env %s and version %s - %s", api, version, err)
					}
					fmt.Printf("%s", outSubst)
				}
			}
		}
	}
}
