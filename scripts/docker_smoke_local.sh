docker run --rm -v ${PWD}/../collection:/etc/postman \
    -v ${PWD}/../env:/etc/env \
    -v ${PWD}/../report:/etc/report \
    -t postman/newman run \
    /etc/postman/smoke.postman_collection.json \
    --environment="/etc/env/docker.postman_environment.json" \
    --reporters junit --reporter-junit-export="/etc/report/Smoke-report.xml"