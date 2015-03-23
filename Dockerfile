FROM python:3.4.2
MAINTAINER Robert Northard <robertnorthard@googlemail.com>

# Install pip
RUN pip install troposphere

ADD start.sh /
CMD bash /start.sh
