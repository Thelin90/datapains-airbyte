export ENV := local
export NAMESPACE := airbyte

.PHONY: deploy
deploy:
	kubectl create namespace $(NAMESPACE) || true
	helm $(CMD) -f tools/k8s/$(ENV)/values.yaml datapains-airbyte airbyte/airbyte --namespace $(NAMESPACE)

.PHONY: delete
delete:
	helm uninstall datapains-airbyte --namespace airbyte
