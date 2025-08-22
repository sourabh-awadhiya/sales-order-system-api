%dw 2.0
output application/json
---
[
    payload.orderId,
    payload.opportunityId,
    payload.customerName,
    payload.orderDate as String {format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"},
    payload.amount as String,
    payload.status,
    write(payload.lineItems, "application/json"),
    payload.notes default ""
]