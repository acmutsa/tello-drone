from __future__ import print_function
import cv2 as cv
import argparse
import os

def detectAndDisplay(frame):
    frame_gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
    frame_gray = cv.equalizeHist(frame_gray)

    bodies = full_body_cascade.detectMultiScale(frame_gray)
    for (x, y, w, h) in bodies:
        center = (x + w//2, y + h//2)
        frame = cv.ellipse(frame,
                           center,
                           (w//2, h//2), 0, 0, 360, (255, 0, 255), 4)
        faceROI = frame_gray[y:y+h, x:x+w]

    cv.imshow('Capture - Body detection', frame)


parser = argparse.ArgumentParser(description='Argument parser for tello-drone.')
parser.add_argument('--body_cascade', help='Path to body cascade.', default='haarcascade_fullbody.xml')
parser.add_argument('--device', help='Path camera.', default='/dev/video0')
args = parser.parse_args()
body_cascade_name = args.body_cascade
camera = args.device
full_body_cascade = cv.CascadeClassifier()

# Load the cascades
if not full_body_cascade.load(cv.samples.findFile(body_cascade_name)):
    print('--(!)Error loading body cascade')
    exit(0)

# Read the video stream
camera_device = cv.VideoCapture(camera)

if not camera_device.isOpened:
    print('--(!)Error opening video capture')
    exit(0)

while True:
    ret, frame = camera_device.read()
    if frame is None:
        print('--(!) No captured frame -- Break!')
        break

    detectAndDisplay(frame)

    if cv.waitKey(10) == 27:
        break

