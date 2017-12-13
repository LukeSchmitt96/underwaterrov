#!/bin/bash
PROJECT_NAME=Oceantest1
#DOCKER_IMAGE=ros_image_kinetic
DEMO_PATH=/underwaterrov
#CATKIN_WS_PATH=/home/docker/catkin_ws_uwsim

#cleanning prev run
tmux kill-session -t dronelab
source /DroneLab/scripts/common.sh

kill_images ros_kinetic
kill_images python3_dev
tmux new-session -d -s dronelab

#tmux send-keys "cd ../../dockers/ros_image_indigo/ && ./run_image.sh " ENTER
tmux send-keys "./run_kinetic_image.sh" ENTER
tmux send-keys "export UNREAL_PROXY_PATH=/underwaterrov/unreal_proxy/" ENTER
#tmux send-keys "export CATKIN_WS_PATH=$CATKIN_WS_PATH" ENTER
tmux send-keys "export DEMO_PATH=$DEMO_PATH" ENTER
tmux send-keys "cd $DEMO_PATH" ENTER
tmux send-keys "source run_tmux_parag.sh" ENTER
#run_inside_script "./run_rosmain.sh"

tmux new-window -n unreal
#tmux send-keys "cd ../../dockers/unreal_engine_4 && ./attach.sh" ENTER
#tmux send-keys "cd /project_files/${PROJECT_NAME}" ENTER
#tmux send-keys "./run.sh"

tmux select-window -t 0
#tmux set -g mouse on
tmux att
