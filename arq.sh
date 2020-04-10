#!/bin/bash
echo "_____________TroubleShotting_K8S__________________"
echo "__         0. Configurar k8s Prod            _____"
echo "__         1. Consulta Pods                  _____"
echo "__         2. Logs Dos Pods                  _____"
echo "__         3. Describe Pods                  _____"
echo "__________________________________________________"
echo -n "Select Option: " ; read OPTION

	case  $OPTION in
		0)
		 echo " Aguarde a execução ..."
                 kubectl config set-credentials k8s.prod.easynvest.io --username=admin --password=jgBZE73znP6KGTVFmWO7JELitXE3slgY
		 kubectl config set-cluster k8s.prod.easynvest.io --insecure-skip-tls-verify=true --server=https://api.k8s.prod.easynvest.io
		 kubectl config set-context k8s.prod.easynvest.io --user=k8s.prod.easynvest.io --namespace=default --cluster=k8s.prod.easynvest.io
		 kubectl config use-context k8s.prod.easynvest.io
		 kubectl get secrets
		 kubectl describe secret;;
  		 
		1)
		    echo -n " Coloque o nome da api: "
  		   read API
 		 kubectl get po --all-namespaces | grep $API;;
		
		2)
		 echo -n " Coloque o nome da api: "
                 read API
                 kubectl get po --all-namespaces | grep $API

		 echo -n " Coloque o nome do namespace: "
                 read SPACE
		 ##echo -n " Coloque o nome da API: "
                 #read POD
                kubectl logs -n $SPACE -l=app.kubernetes.io/instance=$API;;
		##kubectl logs -n $SPACE $POD;;
		*)
	esac

