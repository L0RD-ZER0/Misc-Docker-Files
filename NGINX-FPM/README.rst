FPM-Docker
==========

An easy docker-compose_ config to easily dockerise web applications to run with Docker_ that require PHP-FPM_ to be used together with NGINX_, and a MySQL_ database.

How to use?
-----------

To use this, you need to populate `fpm-app` directory with your application which makes use of PHP-FPM_ to run together with NGINX_. Edit the `docker-compose.yaml` to apply your SSL_ certificates, and then run ``docker compose up`` to start the application.

Directory Structure
-------------------

For this project, you'll be greeted with the following directory structure:

.. code:
  project_root
  ├── FPM.Dockerfile       -> For additional PHP extensions
  ├── README.rst
  ├── docker-compose.yaml  -> compose file
  ├── mysql
  │   └── *                -> your fpm-mysql
  ├── fpm-app
  │   └── *                -> your fpm-application
  ├── ng-log
  │   ├── access.log       -> Default NGINX access-log
  │   └── error.log        -> Default NGINX error-log
  └── nginx-conf
      └── default.conf     -> Default NGINX config
 
Some explanations regarding individual files or directories:

FPM.Dockerfile
**************

Dockerfile used to build a FPM server image with required plugin configurations. Refer to Docker's `PHP <https://hub.docker.com/_/php>`_ image for further reference.

docker-compose.yaml
*******************

Compose file used to compose the FPM Project. Edit this file to make changes to compose, switch out images, or any other configuration as necessary. To run the applicaiton, you must mount your SSL credentials (certificate, and associated private key) inside the container at the specified paths.

mysql
*****

This directory contians all of the data stored in your MySQL database. It is mounted inside the container using a bind mount, used to persist data between containers.

nginx-config
************

This directory contains site configurations for your nginx applications, and is mounted to ``/etc/nginx/conf.d``, from where all the files ending with ``.conf`` are loaded in order to run the servers. It contains a default configuration file, ``default.conf``, which is set up with a minimal SSL configuration to make use of provided certificates, and upturn any http traffic to https.

ng-log
******

This directory contains the default NGINX_ access and error log files as specified by the default configuration shipped in the project. It mounts to ``/var/log/nginx``, and contains all the logfiles for container running NGINX_.

fpm-app
*******

This directory contains your application which requires PHP-FPM_ to be used with NGINX_. This directory is mounted in both the containers running NGINX_, and PHP-FPM_ at ``/usr/share/nginx/html`` inside both of the containers. In order to change this location, you have to ensure that the files are available to both the NGINX_ process, and the PHP-FPM_ process in their respective containers.

Issues & Problems
-----------------

For any problems with this configuration, please reach out at the `GitHub's Issues Page for the Root Repository <Issues_>`_ of this project.



.. _Docker: https://docker.com
.. _docker-compose: https://docs.docker.com/compose/
.. _SSL: https://www.cloudflare.com/en-gb/learning/ssl/what-is-ssl/
.. _PHP-FPM: https://www.php.net/manual/en/book.fpm.php
.. _NGINX: https://nginx.com
.. _MySQL: https://www.mysql.com
.. _Issues: https://github.com/L0RD-ZER0/Misc-Docker-Files/issues
