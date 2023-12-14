FROM ubuntu:22.04

RUN sudo apt update
RUN sudo apt install wget unzip 
RUN sudo apt install mono-complete dotnet-sdk-6.0
RUN wget https://github.com/godotengine/godot/releases/download/4.1.1-stable/Godot_v4.1.1-stable_linux.x86_64.zip -O godot.zip
RUN unzip godot.zip
RUN sudo mv Godot_v4.1.1-stable_linux.x86_64 /usr/local/bin/godot-engine
RUN sudo chmod a+x /usr/local/bin/godot-engine
RUN godot-engine
