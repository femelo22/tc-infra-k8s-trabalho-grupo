-- Manifestos yaml para subir a aplicação com K8S

- Arquivo NAMESPACE 
    - Config para criação do namespace onde vão ficar os containers do projeto

- Pasta API-CORE
    - Contém as configs de deployment e service para a api-core

- Pasta WEBHOOK-PAYMENT
    - Contém as configs de deployment e service para o webhook

- Pasta MYSQL
    - Contém as configs de deployment, service e pvc (volume) para o banco de dados MYSQL

- Pasta ENVS
    - Contém os secrets da aplicação, utilizando o tipo Opaque (passamos os valores em Base64)


Como executar:

Torne executável:: chmod +x deploy.sh
Executar: ./deploy.sh

Torne executável:: chmod +x destroy.sh
Executar: ./destroy.sh