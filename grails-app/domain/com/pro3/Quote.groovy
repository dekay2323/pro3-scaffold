package com.pro3

class Quote {
    String name
    BigDecimal price
    Date shipDate

    Date dateCreated
    Date lastUpdated

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 0..25
        price nullable: false, scale: 2
        shipDate nullable: false
    }

    public String toString() {
        "${name}"
    }
}
