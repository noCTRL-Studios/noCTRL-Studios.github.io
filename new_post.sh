#!/bin/bash

# Directory for posts
POST_DIR="_posts"

# Ask for post title
read -p "Enter post title: " TITLE
read -p "Enter author: " AUTHOR
read -p "Enter categories (comma separated): " CATEGORIES
read -p "Enter tags (comma separated): " TAGS

# Format date
DATE=$(date +"%Y-%m-%d %H:%M:%S %z")
FILENAME_DATE=$(date +"%Y-%m-%d")
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
FILENAME="$POST_DIR/$FILENAME_DATE-$SLUG.md"

# Create posts directory if it doesn't exist
mkdir -p "$POST_DIR"

# Write front matter
cat > "$FILENAME" <<EOL
---
title: "$TITLE"
author: $AUTHOR
date: $DATE
categories: [${CATEGORIES//,/ }]
tags: [${TAGS//,/ }]
render_with_liquid: false
---

Write your post here...
EOL

echo "New post created at $FILENAME"
