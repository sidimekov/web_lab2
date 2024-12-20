const canvas = document.getElementById("plot-canvas")
const ctx = canvas.getContext('2d')

const centerX = canvas.width / 2
const centerY = canvas.height / 2
const scale = 40
let points = []

function drawCoordinatePlane() {
    ctx.clearRect(0, 0, canvas.width, canvas.height)

    ctx.beginPath()
    ctx.moveTo(0, centerY)
    ctx.lineTo(canvas.width, centerY)
    ctx.strokeStyle = 'black'
    ctx.lineWidth = 2
    ctx.stroke()

    ctx.beginPath()
    ctx.moveTo(centerX, 0)
    ctx.lineTo(centerX, canvas.height)
    ctx.strokeStyle = 'black'
    ctx.lineWidth = 2
    ctx.stroke()

    ctx.font = '10px Arial'
    for (let i = -5; i <= 5; i++) {
        if (i !== 0) {
            ctx.fillText(i, centerX + i * scale - 5, centerY + 15)
            ctx.beginPath()
            ctx.moveTo(centerX + i * scale, centerY - 5)
            ctx.lineTo(centerX + i * scale, centerY + 5)
            ctx.stroke()

            ctx.fillText(-i, centerX - 15, centerY + i * scale + 5)
            ctx.beginPath()
            ctx.moveTo(centerX - 5, centerY + i * scale)
            ctx.lineTo(centerX + 5, centerY + i * scale)
            ctx.stroke()
        }
    }
}

function drawPlot(r) {
    r *= scale

    ctx.beginPath()
    ctx.arc(centerX, centerY, r, -Math.PI / 2, Math.PI, true)
    ctx.lineTo(centerX, centerY)
    ctx.closePath()
    ctx.fillStyle = 'rgba(98,227,251,0.3)'
    ctx.fill()
    ctx.strokeStyle = 'rgb(97,220,244)'
    ctx.stroke()

    ctx.beginPath()
    ctx.moveTo(centerX, centerY)
    ctx.lineTo(centerX + r, centerY)
    ctx.lineTo(centerX, centerY - r / 2)
    ctx.closePath()
    ctx.fill()
    ctx.stroke()

    ctx.beginPath()
    ctx.rect(centerX - r, centerY, r, r)
    ctx.closePath()
    ctx.fill()
    ctx.stroke()
    ctx.strokeStyle = 'rgb(0,0,0)'
}


function addPoint(x, y, r, isIn) {
    const xCanvas = centerX + x * scale
    const yCanvas = centerY - y * scale

    ctx.beginPath()
    ctx.arc(xCanvas, yCanvas, 4, 0, Math.PI * 2)
    ctx.fillStyle = isIn ? 'blue' : 'red'
    ctx.fill()
    ctx.stroke()

    points.push({x,y})
}