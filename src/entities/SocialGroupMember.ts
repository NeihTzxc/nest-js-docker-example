import { Column, Entity, Index } from "typeorm";

@Index("unique_userid_group_id", ["groupId", "userId"], { unique: true })
@Index("social_group_member_pkey", ["id"], { unique: true })
@Entity("social_group_member", { schema: "public" })
export class SocialGroupMember {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("bigint", { name: "group_id", unique: true })
  groupId: string;

  @Column("bigint", { name: "user_id", unique: true })
  userId: string;

  @Column("smallint", { name: "role" })
  role: number;

  @Column("smallint", { name: "status", default: () => "10" })
  status: number;

  @Column("timestamp without time zone", {
    name: "last_read_at",
    nullable: true,
    default: () => "now()",
  })
  lastReadAt: Date | null;

  @Column("bigint", { name: "invited_by", nullable: true })
  invitedBy: string | null;

  @Column("bigint", { name: "accepted_by", nullable: true })
  acceptedBy: string | null;
}
