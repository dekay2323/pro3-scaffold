package com.pro3

class LineItem {
    String code
    Wbs wbs
    String description
    Integer quantity
    String unitOfMeasure
    BigDecimal extendedPrice

    static belongsTo = [request: Request]

    Date dateCreated
    Date lastUpdated

    static constraints = {
        code nullable: false
        wbs nullable: true
        description nullable: true, size: 0..500
        quantity nullable: true
        unitOfMeasure nullable: true, size: 0..25
        extendedPrice nullable: true, scale: 2
    }

    public String toString() {
        "${code}"
    }
}
