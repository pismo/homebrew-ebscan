# EBScan

## CLI to manipulates Elasticbeanstalk environmnet variables for all environments at once

### Setup

All you need is a valid AWS config file in place

### Install

```
# set the AWS region
export AWS_DEFAULT_REGION=sa-east-1

# Homebrew install
brew tap pismo/homebrew-ebscan
brew install homebrew-ebscan
```

### Usage

#### List current environments using a variable containing some string

```
homebrew-ebscan \
    -contains http://current.value.you.are.looking.for
```

#### Set all occurences of an environment variable to a new value
#### `(Warning: dangerous operation, this will possibly affect all eb aplications and environment instances)` 


```
homebrew-ebscan \
    -contains http://current.value.you.are.looking.for \
    -set VAR_NAME \
    -to http://current.value.you.are.looking.for
```
