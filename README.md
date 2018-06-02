# EBScan

## CLI to manipulates Elasticbeanstalk environmnet variables for all environments at once

### Requirements

AWS eb cli installed

### Setup

All you need is a valid AWS config file in place

### Install

```
# set the AWS region
export AWS_DEFAULT_REGION=sa-east-1

# Download and extract ebscan
wget https://github.com/pismo/ebscan/releases/download/v0.1.2/ebscan_0.1.2_Tux_64-bit.tar.gz
tar -zxvf ebscan_0.1.2_Tux_64-bit.tar.gz

# Add execution permission to the app
chmod +x ebscan_0.1.2_Tux_64-bit/ebscan
```

### Usage

#### List current environments using a variable containing some string

```
./ebscan \
    -contains http://current.value.you.are.looking.for
```

#### Set all occurences of an environment variable to a new value
#### `(Warning: dangerous operation, this will possibly affect all eb aplications and environment instances)` 


```
./ebscan \
    -contains http://current.value.you.are.looking.for \
    -set VAR_NAME \
    -to http://current.value.you.are.looking.for
```
