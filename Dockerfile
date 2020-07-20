FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.7-jre-slim-buster

ARG APP=dependency-check
ARG VERSION=5.3.2
RUN curl --insecure -L https://bintray.com/jeremy-long/owasp/download_file?file_path=${APP}-${VERSION}-release.zip -o /usr/share/${APP}.zip \
    && unzip /usr/share/${APP}.zip -d /usr/share/ \
    && rm -rf /usr/share/${APP}.zip

ENV RUN_DEPENDENCY_CHECK=/usr/share/${APP}/bin/${APP}.sh