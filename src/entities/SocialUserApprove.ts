import { Column, Entity } from "typeorm";

@Entity("social_user_approve", { schema: "public" })
export class SocialUserApprove {
  @Column("bigint", { name: "id", nullable: true })
  id: string | null;

  @Column("timestamp without time zone", {
    name: "created_at",
    default: () => "now()",
  })
  createdAt: Date;

  @Column("timestamp without time zone", {
    name: "updated_at",
    default: () => "now()",
  })
  updatedAt: Date;

  @Column("boolean", { name: "deleted_flg", default: () => "false" })
  deletedFlg: boolean;

  @Column("bigint", { name: "user_id", nullable: true })
  userId: string | null;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;

  @Column("jsonb", { name: "review_content", nullable: true })
  reviewContent: object | null;

  @Column("smallint", { name: "status", nullable: true })
  status: number | null;
}
