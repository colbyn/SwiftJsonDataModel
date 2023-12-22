//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 12/22/23.
//

import Foundation
import JsonDataModel
let source = """
{
  "model" : "gpt-3.5-turbo-0613",
  "created" : 1703285199,
  "system_fingerprint" : null,
  "id" : "chatcmpl-8YiZr7YraVUZYsmxBA5Lj9sjT3J0r",
  "usage" : {
    "prompt_tokens" : 23,
    "completion_tokens" : 9,
    "total_tokens" : 32
  },
  "choices" : [
    {
      "logprobs" : null,
      "message" : {
        "role" : "assistant",
        "content" : "Hello! How can I assist you today?"
      },
      "index" : 0,
      "finish_reason" : "stop"
    }
  ],
  "object" : "chat.completion"
}

"""

let json = try! JSON.Value.parse(source: source)
print("json")
let choices = json["choices"]?.asArray ?? []
print(choices)
