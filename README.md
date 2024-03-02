# efinity-docker
Docker image for Efinix Efinity Software

## Instructions
1) Download Efinity 2023.2, and any patches, from the [Efinix website](https://www.efinixinc.com/products-efinity.html)
2) Extract Efinity into this Repo under the /efinity directory. This has been git ignored.
3) Apply any patches
4) Run `docker compose build`
5) Run the image:<br>
    a) in ineractive mode: `docker run -it efinity:2023.2 /bin/bash` then `efinity`<br>
    b) directly: `docker run efinity:2023.2 efinity`