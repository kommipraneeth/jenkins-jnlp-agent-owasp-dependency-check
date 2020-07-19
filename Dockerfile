FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.7-jre-slim-buster

ARG DEPENDENCY_CHECK_VERSION=5.3.2
RUN curl -fsSL https://bintray.com/jeremy-long/owasp/download_file?file_path=dependency-check-$DEPENDENCY_CHECK_VERSION-release.zip > /usr/share/dependency-check.zip \
    && unzip /usr/share/dependency-check.zip -d /usr/share/ \
    && rm -rf  /usr/share/dependency-check.zip

ENV RUN_DEPENDENCY_CHECK="/usr/share/dependency-check/bin/dependency-check.sh"