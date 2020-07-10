FROM jenkins/inbound-agent:4.3-4-alpine as jnlp

FROM owasp/dependency-check:5.3.2

USER root

RUN apk -U add git

ENV PATH="${PATH}:$JAVA_HOME/bin"
ENV RUN_DEPENDENCY_CHECK="/usr/share/dependency-check/bin/dependency-check.sh"

COPY --from=jnlp /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]