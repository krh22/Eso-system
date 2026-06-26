/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "6gpobksmfquhf4h",
    "created": "2026-06-26 09:03:14.870Z",
    "updated": "2026-06-26 09:03:14.870Z",
    "name": "log",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "fpvdvkyi",
        "name": "type",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "expense",
            "food",
            "mood",
            "idea",
            "task_done"
          ]
        }
      },
      {
        "system": false,
        "id": "a1i9r7f3",
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
        "id": "mjoah5fw",
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
            "savings"
          ]
        }
      },
      {
        "system": false,
        "id": "flisf0r0",
        "name": "mood",
        "type": "select",
        "required": false,
        "presentable": false,
        "unique": false,
        "options": {
          "maxSelect": 1,
          "values": [
            "clear",
            "heavy",
            "social",
            "low"
          ]
        }
      },
      {
        "system": false,
        "id": "y4s8eiz0",
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
        "id": "nvna7x3f",
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
  const collection = dao.findCollectionByNameOrId("6gpobksmfquhf4h");

  return dao.deleteCollection(collection);
})
