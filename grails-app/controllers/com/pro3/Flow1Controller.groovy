package com.pro3

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED

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

    @Transactional
    def saveRequestItem(RequestItem requestItem) {
        if (requestItem == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (requestItem.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond (requestItem.errors, view:'createRequestItem')
            return
        }

        requestItem.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'requestItem.label', default: 'RequestItem'), requestItem.id])
                redirect action:'procurementPlan', id:requestItem?.project?.id
            }
            '*' { respond(view: 'editRequestItem', requestItem, [status: CREATED]) }
        }
    }

    def editRequestItem(RequestItem requestItem) {
        respond requestItem
    }

    def createProject() {
        respond new Project(params)
    }

    @Transactional
    def saveProject(Project project) {
        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond project.errors, view:'create'
            return
        }

        project.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*' { respond(view: 'projectList', project, [status: CREATED]) }
        }
    }

    def editProject(Project project) {
        respond project
    }

    def createRequestItem() {
        respond new RequestItem(params)
    }
}
