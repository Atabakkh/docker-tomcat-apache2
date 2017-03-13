#RUN echo 'running tompac , jsp servlet '

FROM microsoft/nanoserver
COPY testfile.txt c:\\
RUN dir c:\
