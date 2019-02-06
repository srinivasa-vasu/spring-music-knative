namespace=$1
kubectl create ns $namespace
kubectl label namespace $namespace istio-injection=enabled
kubectl apply -f https://raw.githubusercontent.com/knative/build-templates/master/jib/jib-gradle.yaml -n $namespace
kubectl apply -f src/main/k8s/secret.yml -n $namespace
kubectl apply -f src/main/k8s/sa.yml -n $namespace
kubectl apply -f src/main/k8s/service-jib.yml -n $namespace