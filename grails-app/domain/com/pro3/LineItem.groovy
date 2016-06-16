package com.pro3

class LineItem {
    String wbs
    String description
    Integer quantity
    String unitOfMeasure
    BigDecimal unitPrice

    Date dateCreated
    Date lastUpdated

    static constraints = {
        wbs nullable: true
        description nullable: true
        quantity nullable: true
        unitOfMeasure nullable: true
        unitPrice nullable: true, scale: 2

        dateCreated nullable: false
        lastUpdated nullable: false

    }
}
