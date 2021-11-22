from __future__ import print_function
import cv2.cv2
from cvzone.PoseModule import PoseDetector
import argparse
from djitellopy import Tello

tello = Tello()

tello.connect()
keepRecording = True
tello.streamon()
# img = tello.get_frame_read()

parser = argparse.ArgumentParser(description='Argument parser for tello-drone.')
parser.add_argument('--body_cascade', help='Path to body cascade.', default='haarcascade_fullbody.xml')
parser.add_argument('--device', help='Path camera.', default='/dev/video0')
args = parser.parse_args()
body_cascade_name = args.body_cascade
#camera = args.device
full_body_cascade = cv2.CascadeClassifier()

# Read the video stream
detector = PoseDetector()

if not full_body_cascade.load(cv2.samples.findFile(body_cascade_name)):
    print('--(!)Error loading body cascade')
    exit(0)

# if not cap.isOpened:
#     print('--(!)Error opening video capture')
#     exit(0)

while True:
    # `ret, frame = cap.read(
    img = tello.get_frame_read()
    if img is None:
        print('--(!) No captured frame -- Break!')
        break

    # success, img = cap.read()
    pose = detector.findPose(img)
    lmList, bboxInfo = detector.findPosition(pose)
    cv2.imshow("Window", pose)
    cv2.waitKey(1)
    if cv2.waitKey(10) == 27:
        break
