//
// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import ballerina/http;

documentation {Set the client configuration}
public function <TwitterConfiguration twitterConfig> TwitterConfiguration () {
    twitterConfig.clientConfig = {};
}

public function Client::init (TwitterConfiguration twitterConfig) {
    twitterConfig.uri = "https://api.twitter.com";
    self.twitterConnector.accessToken = twitterConfig.accessToken;
    self.twitterConnector.accessTokenSecret = twitterConfig.accessTokenSecret;
    self.twitterConnector.clientId = twitterConfig.clientId;
    self.twitterConnector.clientSecret = twitterConfig.clientSecret;
    twitterConfig.clientConfig.targets = [{url:twitterConfig.uri}];
    self.twitterConnector.clientEndpoint.init(twitterConfig.clientConfig);
}

public function Client::register(typedesc serviceType) {}

public function Client::start() {}

public function Client::getClient() returns TwitterConnector {
    return self.twitterConnector;
}

public function Client::stop() {}
