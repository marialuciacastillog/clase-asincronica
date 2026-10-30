import os
import psycopg
from flask import Flask, jsonify, request

app = Flask(__name__)
INSTANCE = os.getenv("INSTANCE", "api-local")

def get_connection():
    return psycopg.connect(
        host=os.getenv("DB_HOST"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )

@app.get("/products")
def list_products():
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, name, price FROM products ORDER BY id")
    rows = cur.fetchall()
    cur.close()
    conn.close()

    lista = []
    for row in rows:
        lista.append({
            "id": row[0],
            "name": row[1],
            "price": float(row[2])
        })

    return jsonify({
        "served_by": INSTANCE,
        "products": lista
    })

@app.get("/products/<int:id>")
def get_product(id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, name, price FROM products WHERE id = %s", (id,))
    row = cur.fetchone()
    cur.close()
    conn.close()

    if row is None:
        return jsonify({
            "served_by": INSTANCE,
            "error": "Producto no encontrado"
        }), 404

    return jsonify({
        "served_by": INSTANCE,
        "product": {
            "id": row[0],
            "name": row[1],
            "price": float(row[2])
        }
    })

@app.post("/products")
def create_product():
    data = request.get_json()

    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO products (name, price) VALUES (%s, %s) RETURNING id",
        (data["name"], data["price"])
    )
    nuevo_id = cur.fetchone()[0]
    conn.commit()
    cur.close()
    conn.close()

    return jsonify({
        "served_by": INSTANCE,
        "created_id": nuevo_id
    }), 201

@app.put("/products/<int:id>")
def update_product(id):
    data = request.get_json()

    conn = get_connection()
    cur = conn.cursor()
    cur.execute(
        "UPDATE products SET name = %s, price = %s WHERE id = %s",
        (data["name"], data["price"], id)
    )
    filas = cur.rowcount
    conn.commit()
    cur.close()
    conn.close()

    if filas == 0:
        return jsonify({
            "served_by": INSTANCE,
            "error": "Producto no encontrado"
        }), 404

    return jsonify({
        "served_by": INSTANCE,
        "updated_id": id
    })

@app.delete("/products/<int:id>")
def delete_product(id):
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("DELETE FROM products WHERE id = %s", (id,))
    filas = cur.rowcount
    conn.commit()
    cur.close()
    conn.close()

    if filas == 0:
        return jsonify({
            "served_by": INSTANCE,
            "error": "Producto no encontrado"
        }), 404

    return jsonify({
        "served_by": INSTANCE,
        "deleted_id": id
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)