FROM python:3.8-alpine
ENV FLASK_APP js_example
COPY . .
RUN rm -rf dockerfile \
&& pip3 install -e ./student-exam2
EXPOSE 5000
CMD flask run -h 0.0.0.0 -p 5000
