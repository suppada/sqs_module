SHELL:=/bin/bash

all: help

get:
	@echo "Updating modules"
	@terraform get -update

plan:
	@echo "Checking Infrastracture"
	@terraform plan \
		-lock=true \
		-input=false \
		-refresh=true \
		-out terraform.tfplan

fmt:
	@echo "Format existing code"
	@terraform fmt \
		-write=true \
		-recursive

validate:
	@echo "Validating existing code"
	@terraform validate

apply:
	@echo "Init the terraform"
	@terraform init
	@echo "Applying changes to Infrastracture"
	@terraform apply \
		-lock=true \
		-input=false \
		-refresh=true \
		--auto-approve

destroy:
	@echo "destroying existing Infrastracture"
	@terraform destroy \
		-lock=true \
		-input=false \
		-refresh=true \
		--auto-approve

confirm:
	read -r -t 5 -p "Type y to apply, otherwise it will abort (timeout in 5 seconds): " CONTINUE; \
	if [ ! $$CONTINUE == "y" ] || [ -z $$CONTINUE ]; then \
	    echo "Abort apply." ; \
		exit 1; \
	fi