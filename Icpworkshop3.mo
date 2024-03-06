import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Text "mo:base/Text";

actor class InsuranceCanister {
    public type Policy = {
        id: Nat;
        holder: Text;
        premium: Nat;
        coverage: Nat;
        isActive: Bool;
    };

    var policies: [Policy] = [];

    public func createPolicy(holder: Text, premium: Nat, coverage: Nat): Policy {
        let newPolicy: Policy = {
            id: policies.length + 1;
            holder: holder;
            premium: premium;
            coverage: coverage;
            isActive: true;
        };
        policies := policies ++ [newPolicy];
        return newPolicy;
    }

    public func getPolicy(policyId: Nat): ?Policy {
        return Array.find((p) => p.id == policyId, policies);
    }
};