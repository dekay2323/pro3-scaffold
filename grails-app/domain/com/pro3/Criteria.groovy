package com.pro3

class Criteria {
    String name
    String weighting

    Date dateCreated
    Date lastUpdated

    static belongsTo = [request: Request]

    static constraints = {
        name nullable: false, blank: false
        weighting nullable: true
    }

    public String toString() {
        "${name}"
    }
}
