const express = require('express')
const redis = require('redis')

const app = express()
const client = redis.createClient()

client.set('visits', 0)

app.get('/', (req, res) => {
    client.get('visits', (err, visits) => {
        visits = parseInt(visits) ++
        res.send("Número de vistantes é: " + visits)
        client.set('visits', parseInt(visits))
    })
})

app.listen(8081, () => {
    console.log("Serviço iniciado na porta: 8081");
})
