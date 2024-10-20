#!/bin/bash

BASE_PATH=$PROJECT_DIR/$TARGET_NAME
FIREBASE_DIR=$BASE_PATH/config/$BUILD_ENV

echo "execute copy GoogleService-Info.plist"
FIREBASE_INFO_PLIST="GoogleService-Info.plist"
FIREBASE_INFO_PLIST_PLIST_DST=$BASE_PATH/$FIREBASE_INFO_PLIST
FIREBASE_INFO_PLIST_PLIST_SRC=$FIREBASE_DIR/$FIREBASE_INFO_PLIST
cp -Rf "$FIREBASE_INFO_PLIST_PLIST_SRC" "$FIREBASE_INFO_PLIST_PLIST_DST"
