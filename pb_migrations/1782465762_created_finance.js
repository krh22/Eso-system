/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "qu04wweefmmsia5",
    "created": "2026-06-26 09:22:42.032Z",
    "updated": "2026-06-26 09:22:42.032Z",
    "name": "finance",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "txe5se9z",
        "name": "category",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "food",
            "transport",
            "social",
            "bills",
            "hosting",
            "savings",
            "income"
          ]
        }
      },
      {
        "system": false,
        "id": "bbqn2sju",
        "name": "amount",
        "type": "number",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "noDecimal": false
        }
      },
      {
        "system": false,
        "id": "mer9wzmy",
        "name": "week",
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
        "id": "h2gmoals",
        "name": "direction",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "in",
            "out"
          ]
        }
      },
      {
        "system": false,
        "id": "dt1m4a0j",
        "name": "note",
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
        "id": "pjfcbtue",
        "name": "date",
        "type": "date",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "min": "",
          "max": ""
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
  const collection = dao.findCollectionByNameOrId("qu04wweefmmsia5");

  return dao.deleteCollection(collection);
})
