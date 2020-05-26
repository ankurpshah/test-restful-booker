docker run --rm -v ${PWD}/../collection:/etc/postman \
    -v ${PWD}/../data:/etc/data \
    -v ${PWD}/../env:/etc/env \
    -v ${PWD}/../report:/etc/report \
    -t postman/newman run \
    /etc/postman/regression.postman_collection.json \
    --environment="/etc/env/docker.postman_environment.json" \
    -d /etc/data/booking.json \
    --reporters junit --reporter-junit-export="/etc/report/Regression-report.xml"