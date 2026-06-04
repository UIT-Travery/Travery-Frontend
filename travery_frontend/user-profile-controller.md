"/api/v1/profile/avatar": {
      "put": {
        "tags": [
          "user-profile-controller"
        ],
        "operationId": "updateAvatar",
        "requestBody": {
          "content": {
            "multipart/form-data": {
              "schema": {
                "required": [
                  "file"
                ],
                "type": "object",
                "properties": {
                  "file": {
                    "type": "string",
                    "format": "binary"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SingleResponseBaseUserProfileResponse"
                }
              }
            }
          }
        }
      }
    },

"/api/v1/profile/tourist/me": {
      "patch": {
        "tags": [
          "user-profile-controller"
        ],
        "operationId": "updateTouristProfile",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateTouristProfileRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SingleResponseBaseUserProfileResponse"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/profile/admin/me": {
      "patch": {
        "tags": [
          "user-profile-controller"
        ],
        "operationId": "updateAdminProfile",
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateAdminProfileRequest"
              }
            }
          },
          "required": true
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SingleResponseBaseUserProfileResponse"
                }
              }
            }
          }
        }
      }
    },
"/api/v1/profile/me": {
      "get": {
        "tags": [
          "user-profile-controller"
        ],
        "operationId": "getMyProfile",
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SingleResponseBaseUserProfileResponse"
                }
              }
            }
          }
        }
      }
    },