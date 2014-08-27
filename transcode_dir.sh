#! /bin/bash
# transcode files of type $2 to $3 in dir $1
# usage:  transcode_dir.sh /directory/path mp4 avi

from_ext=$2
to_ext=$3
dir=$1
#echo "Converting from: $from_ext to: $to_ext in directory: $dir ..."

for file in $dir*.$from_ext;
  do len_fn=${#file};
  echo "$len_fn";
  cut_len=`expr $len_fn - 4`;
  file_name=`echo $file | cut -c 1-$cut_len`;
  echo "#######################################";
  echo "Converting $file to $file_name.$to_ext";
  echo "#######################################";
  #read -p "Press [ENTER] key to continue converting this file ..."
  # comment the line below out if you merely want to change the container of the file
  #ffmpeg -i $file -vcodec copy -acodec copy $file_name.$to_ext;
  # ffmpeg below transcodes video files from $from_ext to $to_ext with video quality scaled to 8
  ffmpeg -i $file -qscale:v 8 $file_name.$to_ext;
done
