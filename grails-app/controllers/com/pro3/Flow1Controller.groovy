package com.pro3

import grails.transaction.Transactional

@Transactional(readOnly = true)
class Flow1Controller {
    def home() {
    }

    def procurementStats(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }

    def projectList(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model:[projectCount: Project.count()]
    }

    def procurementPlan(Project project) {
        respond project
    }

    def showRequestItem(RequestItem requestItem) {
        respond requestItem
    }
}
