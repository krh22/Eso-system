/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "6lyoxi7hr6rnjzj",
    "created": "2026-06-26 08:40:34.198Z",
    "updated": "2026-06-26 08:40:34.198Z",
    "name": "Inbox",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "6korgcmn",
        "name": "entry",
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
        "id": "1aoxhmsr",
        "name": "tag",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "money",
            "build",
            "feel",
            "task",
            "idea"
          ]
        }
      },
      {
        "system": false,
        "id": "cqrndajz",
        "name": "date",
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
        "id": "blqf83pe",
        "name": "processed",
        "type": "bool",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {}
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
  const collection = dao.findCollectionByNameOrId("6lyoxi7hr6rnjzj");

  return dao.deleteCollection(collection);
})
