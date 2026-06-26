/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "exkkexv5thh9ub1",
    "created": "2026-06-26 09:21:08.833Z",
    "updated": "2026-06-26 09:21:08.833Z",
    "name": "chat_log",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "ldpundqf",
        "name": "role",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "user",
            "ai"
          ]
        }
      },
      {
        "system": false,
        "id": "d84biu5p",
        "name": "message",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "jhpnazbc",
        "name": "session_date",
        "type": "date",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "",
          "max": ""
        }
      },
      {
        "system": false,
        "id": "dwjh2nw6",
        "name": "mode",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "1",
            "2",
            "3"
          ]
        }
      },
      {
        "system": false,
        "id": "tap0uoxe",
        "name": "context_snapshot",
        "type": "text",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("exkkexv5thh9ub1");

  return dao.deleteCollection(collection);
})
