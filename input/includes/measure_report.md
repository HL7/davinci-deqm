~~~
"group": [{
    "id": "group-1",
    "code": {
      "coding": [{
          "system": "http://example.org/group",
          "code": "group"
        }
      ]
    },
    "population": [{
        "id": "initial-population-1",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "initial-population"
            }
          ]
        },
		"count" : 100
      }, {
        "id": "numerator",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "numerator"
            }
          ]
        },
		"count" : 85
      }, {
        "id": "denominator",
        "code": {
          "coding": [{
              "system": "http://terminology.hl7.org/CodeSystem/measure-population",
              "code": "denominator"
            }
          ]
        },
		"count" : 100
	  }],
    "stratifier": [{
        "id": "stratifier-1",
        "code": {
          "text": "Stratifier 1"
        },
		"stratum":[<...>]
      }
    ]
  }
]
~~~
