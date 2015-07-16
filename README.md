# docker-webdev

## A Docker image with common web development tools.

- jekyll
- sass
- compass

Example building a jekyll site. From the root of the site, where `_config.yml` is.

    docker run --rm -u $(id -u):$(id -g) -v $(pwd):/host tortxof/webdev jekyll build
