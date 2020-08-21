FROM subodhhatkar/jenkins-jnlp-agent-openjdk:11.0.8-jre-slim-buster

ARG OWASP_DC_APP=dependency-check
ARG OWASP_DC_VERSION=5.3.2
RUN wget https://dl.bintray.com/jeremy-long/owasp/${OWASP_DC_APP}-${OWASP_DC_VERSION}-release.zip \
    -O ${OWASP_DC_APP}.zip && \
    unzip ${OWASP_DC_APP}.zip && \
    mv ${OWASP_DC_APP} /usr/share/${OWASP_DC_APP} && \
    rm -rf ${OWASP_DC_APP}.zip

ENV RUN_DEPENDENCY_CHECK=/usr/share/${OWASP_DC_APP}/bin/${OWASP_DC_APP}.sh