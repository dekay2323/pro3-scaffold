package com.pro3

class LineItem {
    String wbs
    String description
    Integer quantity
    String unitOfMeasure
    BigDecimal unitPrice

    static belongsTo = [request: Request]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        wbs nullable: true, size: 0..25
        description nullable: true, size: 0..500
        quantity nullable: true
        unitOfMeasure nullable: true, size: 0..25
        unitPrice nullable: true, scale: 2
    }

    public String toString() {
        "${description}"
    }
}
