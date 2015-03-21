FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git python wget python-dev
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN git clone -b add_requirements https://github.com/andrewmichaelsmith/hpfeeds.git
RUN cd hpfeeds && pip install -r requirements.txt && python setup.py install
RUN sed -i 's:DBPATH = "db.sqlite3":DBPATH = "/vol/hpfeeds/db.sqlite3":g' \
	hpfeeds/broker/config.py
CMD python hpfeeds/broker/broker.py
