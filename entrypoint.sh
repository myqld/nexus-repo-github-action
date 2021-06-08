#!/bin/sh -l

# Copyright (c) 2019-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
export PATH=$JAVA_HOME/bin:$PATH

serverurl=$1
echo $serverurl
username=$2
echo $username
password=$3
echo $password
format=$4
echo $format
repository=$5
echo $repository
filename=$GITHUB_WORKSPACE/$8
echo $filename
maven_arg_1=$(echo -C$6 | sed 's/ / -C/g')
echo $maven_arg_1
maven_arg_2=$(echo -A$7 | sed 's/ / -A/g')
echo $maven_arg_2

groovy /opt/sonatype/bin/NexusPublisher.groovy --serverurl $serverurl --username $username --password $password --format $format --repository $repository --filename $filename $maven_arg_1 $maven_arg_2
