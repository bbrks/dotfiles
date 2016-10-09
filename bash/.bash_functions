function servehttp() {
    echo "Serving $PWD at http://127.0.0.1:8080"
    docker run -it -p 8080:8080 -v $PWD:/srv --rm --name servehttp bbrks/httpico
}
