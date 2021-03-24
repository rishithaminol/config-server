FROM devgudppl.azurecr.io/base-container:latest

ENV APP_NAME config-server
ENV APP_HOME /app
EXPOSE 5000

COPY . $APP_HOME/
WORKDIR $APP_HOME
RUN dnf groupinstall "Development Tools" -y
RUN dnf install python3-devel -y
RUN pip install -r requirements.txt
RUN dnf groupremove "Development Tools" -y
CMD ["./server.py"]
