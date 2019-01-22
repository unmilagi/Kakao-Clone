import { expect } from "chai";
import { createRequest, createResponse } from "node-mocks-http";
import { cheack } from "../utile";
import controller from "./user.controller";
const user = {
    platformName: "google",
    socialId: "tjdans174@gmail.com"
};

const postReq = params => ({
    method: "POST",
    url: "/login",
    body: params
});

const getReq = params => ({
    method: "GET",
    url: "/login",
    headers: params
});

describe("User.Controller", () => {
    describe("User login Test", () => {
        describe("should return error", () => {
            let req, res, data;
            before(done => {
                req = createRequest(postReq());
                res = createResponse();
                controller.login(req, res, done);
            });

            beforeEach(() => (data = JSON.parse(res._getData())));

            it("message type cheack", () =>
                expect(data).to.have.all.keys("success", "message"));

            it("should the success false", () =>
                expect(data.success).to.be.equal(false));
        });

        describe("should return the token", () => {
            let req, res, data;
            before(done => {
                req = createRequest(postReq({ user }));
                res = createResponse();
                controller.login(req, res, done);
            });

            beforeEach(() => (data = JSON.parse(res._getData())));

            it("should the status 201", () =>
                expect(res.statusCode).to.equal(201));

            it("message type cheack", () =>
                expect(data).to.have.all.keys("success", "message"));

            it("should the success true", () =>
                expect(data.success).to.be.equal(true));

            it("should the token", () =>
                expect(data.message).have.property("token"));
        });
    });

    describe("User login cheack Test", () => {
        let token;
        describe("should return error", () => {
            let req, res, data;
            before(done => {
                req = createRequest(getReq());
                res = createResponse();
                cheack(req, res, () => {
                    controller.cheack(req, res, done);
                });
            });

            beforeEach(() => (data = JSON.parse(res._getData())));

            it("message type cheack", () =>
                expect(data).to.have.all.keys("success", "message"));

            it("should the success false", () =>
                expect(data.success).to.be.equal(false));
        });
        describe("should return the profile", () => {
            let req, data, res;

            before(done => {
                const login = next => {
                    req = createRequest(postReq({ user }));
                    res = createResponse();
                    controller.login(req, res, next);
                };

                login(() => {
                    const token = JSON.parse(res._getData()).message.token;
                    req = createRequest(getReq({ "x-access-token": token }));
                    res = createResponse();

                    cheack(req, res, () => controller.cheack(req, res, done));
                });
            });

            beforeEach(() => (data = JSON.parse(res._getData())));

            it("message type cheack", () =>
                expect(data).to.have.all.keys("success", "message"));

            it("should the status 201", () =>
                expect(res.statusCode).to.equal(201));

            it("should the profile", () =>
                expect(data.message.profile).to.have.all.keys(
                    "id",
                    "createdAt",
                    "updatedAt",
                    "socialId",
                    "platformName",
                    "nickName",
                    "photos"
                ));
        });
    });
});
