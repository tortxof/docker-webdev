# docker-webdev

## A Docker image with common web development tools.

- jekyll
- sass
- compass

Example building a jekyll site. From the root of the site, where `_config.yml` is.

    docker run --rm -u $(id -u):$(id -g) -v $(pwd):/host tortxof/webdev jekyll build

Run a container for interactive development with node and ruby tools. Allows sudo inside the container to install new global packages.

    docker run -ti --rm -u $(id -u):$(id -g) \
    -v $(pwd):/host -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro -v /etc/sudoers:/etc/sudoers:ro \
    tortxof/webdev

It's a good idea to clean npm's cache before installing global packages in the container.
Npm has issues with the cache existing on other than the current filesystem layer.

    sudo npm cache clean -f
