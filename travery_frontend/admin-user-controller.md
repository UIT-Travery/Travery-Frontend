"/api/v1/admin/users/{id}/avatar": {
      "put": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "updateAvatar_1",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
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
    }

"/api/v1/admin/users/{id}/unban": {
      "patch": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "unbanUser",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
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
    "/api/v1/admin/users/{id}/ban": {
      "patch": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "banUser",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
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
    "/api/v1/admin/users/receptionists/{id}": {
      "patch": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "updateReceptionistProfile",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateReceptionistProfileRequest"
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
    "/api/v1/admin/users/guides/{id}": {
      "patch": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "updateGuideProfile",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateGuideProfileRequest"
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
    "/api/v1/admin/users/coordinators/{id}": {
      "patch": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "updateCoordinatorProfile",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "$ref": "#/components/schemas/UpdateCoordinatorProfileRequest"
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
"/api/v1/admin/users": {
      "get": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "getAllUsers",
        "parameters": [
          {
            "name": "role",
            "in": "query",
            "required": false,
            "schema": {
              "type": "string",
              "enum": [
                "TOURIST",
                "RECEPTIONIST",
                "COORDINATOR",
                "GUIDE",
                "ADMIN"
              ]
            }
          },
          {
            "name": "status",
            "in": "query",
            "required": false,
            "schema": {
              "type": "string",
              "enum": [
                "ACTIVE",
                "PENDING",
                "DELETED",
                "BANNED"
              ]
            }
          },
          {
            "name": "pageable",
            "in": "query",
            "required": true,
            "schema": {
              "$ref": "#/components/schemas/Pageable"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SingleResponsePageBaseUserProfileResponse"
                }
              }
            }
          }
        }
      }
    },
    "/api/v1/admin/users/{id}": {
      "get": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "getUserDetail",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
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
      },
      "delete": {
        "tags": [
          "admin-user-controller"
        ],
        "operationId": "deleteUser",
        "parameters": [
          {
            "name": "id",
            "in": "path",
            "required": true,
            "schema": {
              "type": "string",
              "format": "uuid"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "*/*": {
                "schema": {
                  "$ref": "#/components/schemas/SuccessResponse"
                }
              }
            }
          }
        }
      }
    },