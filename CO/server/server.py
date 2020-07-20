from concurrent import futures
import time
import datetime
import logging
import numpy as np 
import cv2 


import grpc

import api_pb2
import api_pb2_grpc


_ONE_DAY_IN_SECONDS = 60 * 60 * 24

cap = cv2.VideoCapture(0)
face_cascade = cv2.CascadeClassifier('./../opencv-cascades/haarcascade_frontalface_alt2.xml')

class Detector(api_pb2_grpc.DetectorServicer):
    
    def Detect(self, request, context):
        print("Detecting")

        while(True):
            ret , frame = cap.read()
            
            gray = cv2.cvtColor(frame , cv2.COLOR_BGR2GRAY)
            faces = face_cascade.detectMultiScale(gray , scaleFactor=1.5 , minNeighbors=5)
            if len(faces) > 1:
                xi = -10000
                yi = -10000
                print(len(faces))
                for ( x , y , w , h) in faces:
                    print(abs(x-xi)/w)
                    if abs(x-xi)/w < 4 and abs(x-xi)/w > 1:
                        yield api_pb2.DetectorResponse(x=x ,y=y,w=w,h=h)
                        time.sleep(4)
                    xi=x
                    yi=y

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    api_pb2_grpc.add_DetectorServicer_to_server(Detector(), server)
    server.add_insecure_port('[::]:7777')
    print("Detector watching ..")
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    logging.basicConfig()
    serve()
